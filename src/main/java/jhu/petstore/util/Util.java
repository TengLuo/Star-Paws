package jhu.petstore.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.text.DecimalFormat;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicLong;

public class Util {

    // Help encrypt the user password before save to the database
    public static String encryptPassword(String email, String password) throws IOException {
        return DigestUtils.md5Hex(email + DigestUtils.md5Hex(password)).toLowerCase();
    }

    public static void sendEmail(String to, String orderNum, boolean bodyIsHTML)
            throws MessagingException {

        final String username = "vicky.xiang.chen@gmail.com";
        final String password = "zsuedcieluesnixp";
        String from = "vicky.xiang.chen@gmail.com";
        String subject = "Order Confirmation #"+orderNum;
        String body = "Dear customer" + ",\n\n"
                + "Thank you for placing an order with Star Paw. We are pleased to inform you that your order has been received and is being processed.";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        session.setDebug(true);

        try {

            // 2 - create a message
            Message message = new MimeMessage(session);
            message.setSubject(subject);
            if (bodyIsHTML) {
                message.setContent(body, "text/html");
            } else {
                message.setText(body);
            }

            // 3 - address the message
            Address fromAddress = new InternetAddress(from);
            Address toAddress = new InternetAddress(to);
            message.setFrom(fromAddress);
            message.setRecipient(Message.RecipientType.TO, toAddress);
            // 4 - send the message
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
