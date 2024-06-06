<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>

<%
// 이미지를 저장할 디렉토리 경로를 지정합니다.
String uploadDirectory = "/image_profile/";

try {
    // 요청에서 이미지 파일을 읽습니다.
    InputStream imageStream = request.getInputStream();

    // 이미지 파일 이름을 지정합니다.
    String imageName = "image.jpg"; // 원하는 이미지 파일 이름으로 변경

    // 이미지를 디렉토리에 저장합니다.
    FileOutputStream fos = new FileOutputStream(uploadDirectory + File.separator + imageName);
    byte[] buffer = new byte[1024];
    int bytesRead;
    while ((bytesRead = imageStream.read(buffer)) != -1) {
        fos.write(buffer, 0, bytesRead);
    }
    fos.close();

    out.println("이미지가 성공적으로 업로드되었습니다. <img src=/image_profile/image.jpg>");
} catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
}
%>

