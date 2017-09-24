package net.space.utilities;

/**
 * @Author A.Albert
 * @Data 8/31/17
 * @Time 6:01 PM
 * @Version 1.0
 * @Info empty
 */

public class EmailAddress {

    public static final String TO_EMAIL_SOUNDCHECK = "message.service.soundcheck@gmail.com";

    public static String buildMessage(String message, String author, String email) {

        StringBuilder sb = new StringBuilder();

        sb.append(message).append("\n" + "\n" + "\n" + "\t" + "Автор: ").append(author).append("\n").append("\t").append("Email: ").append(email);

        return sb.toString();
    }
}
