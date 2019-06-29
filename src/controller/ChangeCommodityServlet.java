package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.huashan.database.DataBase;
import org.huashan.entity.Commodity;

import com.sun.openpisces.Dasher;

/**
 * Servlet implementation class AddCommodityServlet
 */
@WebServlet("/ChangeCommodityServlet")
public class ChangeCommodityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "D:\\eclipse-workspace\\huashan_bookstore\\WebContent\\images\\commodity";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCommodityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		 // 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }
        
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // 中文处理
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = UPLOAD_DIRECTORY;
       
         
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            DataBase dataBase = DataBase.getInstance();
            String id = "";
            if (formItems != null && formItems.size() > 0) 
            {
                // 迭代表单数据
            	for (FileItem item : formItems) 
                {
                	String fieldname = item.getFieldName();
        	        switch(fieldname)
        	        {
        	        	case "id":id = item.getString("UTF-8");break;
        	        }
                }
            	Commodity commodity = dataBase.getOneCommodity(id);
                
                for (FileItem item : formItems) 
                {
                	String fieldname = item.getFieldName();
        	        switch(fieldname)
        	        {
        	        	case "title":commodity.title = item.getString("UTF-8");break;
        	        	case "description":commodity.description = item.getString("UTF-8");break;
        	        	case "name":commodity.name = item.getString("UTF-8");break;
        	        	case "ISBN":commodity.ISBN = item.getString("UTF-8");break;
        	        	case "publisher":commodity.publisher = item.getString("UTF-8");break;
        	        	case "type":commodity.type = item.getString("UTF-8");break;
        	        	case "price":commodity.price = Double.parseDouble(item.getString("UTF-8"));break;
        	        	case "author":commodity.author = item.getString("UTF-8");break;
        	        	case "stock":commodity.stock =Integer.parseInt(item.getString("UTF-8"));break;
        	        }
                }
                dataBase.updateOneCommodity(commodity);

                for (FileItem item : formItems) 
                {
    	        // 处理不在表单中的字段
                if (item.isFormField() == false) 
                {
                	int lastID = Integer.valueOf(id);
                    String fileName = Integer.toString(lastID);
                    String filePath = uploadPath + File.separator + fileName+".jpg";
                    File storeFile = new File(filePath);
                    // 在控制台输出文件的上传路径
                    System.out.println(storeFile.getAbsolutePath());
                    // 保存文件到硬盘
                    item.write(storeFile);
                    response.sendRedirect("modify.jsp?id="+id);
                    return;
                }
                }
                
            }
        } catch (Exception ex) 
        {
            ex.printStackTrace();
        }
		response.sendRedirect("manager.jsp");
	}

}
