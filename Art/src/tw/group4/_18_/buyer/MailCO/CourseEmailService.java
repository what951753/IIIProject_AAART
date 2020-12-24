package tw.group4._18_.buyer.MailCO;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import tw.group4._04_.front.javaMail.model.EmailServiceImpl;
import tw.group4._18_.buyer.model.CourseOrderItems;
import tw.group4._18_.buyer.model.CourseOrders;

@Service
public class CourseEmailService {

	@Autowired
	private JavaMailSender emailSender;

	@Autowired
	private EmailServiceImpl emailServiceImpl;

	public void mailtoCo(CourseOrders cos) throws MessagingException {
//		String detail="http://localhost:8080/Art/18/coOrderList.ctrl";
		
		CourseMailInfo courseMailInfo = new CourseMailInfo();
		Set<Map<String, CourseOrderItems>> mailSet = courseMailInfo.mailList(cos);
		String text = courseMailInfo.courseMailInfo(mailSet, cos);
		
		
		String to =  cos.getEmail();
		String subject = "藝文課程訂單成立(訂單編號："+cos.getOrderNoCo()+")";
//		String text = 
				
		emailServiceImpl.sendMessageWithAttachment(to, subject, text);
		System.out.println("mail寄出");
	}


	
	
}

