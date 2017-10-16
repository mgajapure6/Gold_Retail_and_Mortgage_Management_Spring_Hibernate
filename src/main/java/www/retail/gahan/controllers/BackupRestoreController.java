package www.retail.gahan.controllers;

import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.retail.gahan.utility.DateFormate;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/backupRestore")
public class BackupRestoreController {
	private static final Logger logger = LoggerFactory.getLogger(BackupRestoreController.class);

	@RequestMapping(value = "/backup", method = RequestMethod.GET)
	public String backup(Locale locale, Model model) {
		logger.info("backup executed");
		
		return "backupRestore/backup";
	}
	
	@RequestMapping(value = "/doBackup", method = RequestMethod.GET)
	@ResponseBody
	public String doBackup(Locale locale, Model model) {
		logger.info("doBackup executed");
		 String today = DateFormate.dateToString(new Date());
		 System.out.println("Todays Date from MySqlBackup : " +today );
	    String executeCmd = "mysqldump --databases -h localhost -u root gahan > F:\\Retail\\backup\\backup-"+today+".sql";

	    Process runtimeProcess;
	  
	    try
	    {
	       runtimeProcess = Runtime.getRuntime().exec(new String[] { "C:\\Windows\\System32\\cmd.exe", "/C", executeCmd });
	       int processComplete = runtimeProcess.waitFor();
	 
	       System.out.println("processComplete : "+processComplete);
	 
	       if(processComplete == 0)
	       {
	          System.out.println("Backup Created Successfully !");
	          return JsonUtil.convertToJson("success"); 
	       }
	       else
	       {
	          System.out.println("Couldn't Create the backup !");
	          return JsonUtil.convertToJson("failed"); 
	       }
	    }
	    catch(Exception ex)
	    {
	       ex.printStackTrace();
	    }
		return JsonUtil.convertToJson("failed"); 
	}
	
	@RequestMapping(value = "/restore", method = RequestMethod.GET)
	public String restore(Locale locale, Model model) {
		logger.info("restore executed");
		return "backupRestore/restore";
	}
	
	@RequestMapping(value = "/doRestore", method = RequestMethod.GET)
	@ResponseBody
	public String doRestore(Locale locale, Model model) {
		logger.info("restore executed");
		return "backupRestore/restore";
	}
}
