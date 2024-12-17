<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
document.getElementById("signup-form").addEventListener("submit", function(event) {
    event.preventDefault(); // 폼 제출을 막고 유효성 검사 후 제출
    
    let valid = true;
    
    // 1. 사용자 이름: 최소 3자 이상
    const username = document.getElementById("username").value;
    if (username.length < 3) {
        alert("사용자 이름은 최소 3자 이상이어야 합니다.");
        valid = false;
    }

    // 2. 이메일: 유효한 이메일 형식
    const email = document.getElementById("email").value;
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(email)) {
        alert("유효한 이메일 주소를 입력해주세요.");
        valid = false;
    }

    // 3. 비밀번호: 최소 8자 이상, 숫자와 문자가 포함되어야 함
    const password = document.getElementById("password").value;
    const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    if (!passwordPattern.test(password)) {
        alert("비밀번호는 최소 8자 이상이어야 하며, 숫자와 문자가 포함되어야 합니다.");
        valid = false;
    }

    // 4. 비밀번호 확인: 비밀번호와 일치해야 함
    const confirmPassword = document.getElementById("confirm-password").value;
    if (password !== confirmPassword) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        valid = false;
    }

    // 유효성 검사 성공 시 폼 제출
    if (valid) {
        alert("회원 가입이 완료되었습니다.");
        // 이곳에서 실제 서버로 데이터를 전송하거나 다른 작업을 할 수 있습니다.
        // 예: 폼.submit(); 
    }
});