package www.retail.gahan.utility;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtilityClass {

	public static String customerProfileUpload(MultipartFile file, String c_name) throws IOException{
		String result = "";
		String fileLocation = "F:/Retail/Customer/Images/";
		String currentFileName = file.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = c_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = Base64.getDecoder().decode(file.getBytes());
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	file.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	public static String webcamCustomerProfileUpload(MultipartFile file, String c_name) throws IOException{
		String result = "";
		String fileLocation = "F:/Retail/Customer/Images/";
		String currentFileName = file.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = c_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = file.getBytes();  
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	file.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
		
	}
	
	public static String supplierProfileUpload(MultipartFile file, String c_name) throws IOException{
		String result = "";
		String fileLocation = "F:/Retail/Supplier/Images/";
		String currentFileName = file.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = c_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = Base64.getDecoder().decode(file.getBytes());
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	file.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	public static String webcamSupplierProfileUpload(MultipartFile file, String c_name) throws IOException{
		String result = "";
		String fileLocation = "F:/Retail/Supplier/Images/";
		String currentFileName = file.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = c_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = file.getBytes();  
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	file.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
		
	}
	
	public static String gahanProductUpload(MultipartFile file, String c_name) throws IOException{
		String result = "";
		String fileLocation = "F:/Retail/Gahan/Images/";
		String currentFileName = file.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = c_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = Base64.getDecoder().decode(file.getBytes());
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	file.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	public static String webcamGahanProductUpload(MultipartFile file, String c_name) throws IOException{
		String result = "";
		String fileLocation = "F:/Retail/Gahan/Images/";
		String currentFileName = file.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = c_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = file.getBytes();  
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	file.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
		
	}
	public static String webcamAdminProfileUpload(MultipartFile adminImageFile, String a_name) throws IOException {
		String result = "";
		String fileLocation = "F:/Retail/Admin/Image/";
		String currentFileName = adminImageFile.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = a_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = adminImageFile.getBytes();  
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	adminImageFile.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	public static String adminProfileUpload(MultipartFile admin_image, String a_name) throws IOException {
		String result = "";
		String fileLocation = "F:/Retail/Admin/Image/";
		String currentFileName = admin_image.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = a_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = Base64.getDecoder().decode(admin_image.getBytes());
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	admin_image.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	public static String salesProductImageUpload(MultipartFile sales_product_imageFile, String sp_name) throws IOException {
		String result = "";
		String fileLocation = "F:/Retail/SalesProducts/Images/";
		String currentFileName = sales_product_imageFile.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = sp_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = Base64.getDecoder().decode(sales_product_imageFile.getBytes());
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	sales_product_imageFile.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	public static String webcamSalesProductImageUpload(MultipartFile sales_product_imageFile, String sp_name) throws IOException {
		String result = "";
		String fileLocation = "F:/Retail/SalesProducts/Images/";
		String currentFileName = sales_product_imageFile.getOriginalFilename();
		String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
		String newFileName = sp_name+extension;
        File pathFile = new File(fileLocation);
        if(!pathFile.exists()){
            pathFile.mkdir();
        }
        byte[] bytes = sales_product_imageFile.getBytes();  
        File dir = new File(fileLocation+File.separator);
        if(!dir.exists()){
		dir.mkdirs();
		}
        File serverFileLocation = new File(dir.getAbsolutePath()+File.separator+newFileName); 
        System.out.println("serverFileLocation : " +serverFileLocation);
        BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(serverFileLocation)); 
        stream.write(bytes);  
        stream.flush();  
	    stream.close();
        try {
        	sales_product_imageFile.transferTo(serverFileLocation);
            result = newFileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	
	
}
