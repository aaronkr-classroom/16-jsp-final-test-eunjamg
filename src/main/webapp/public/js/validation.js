import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class BookRegistration {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 도서 정보 입력 받기
        System.out.println("도서 등록을 시작합니다.");

        // 제목 입력
        System.out.print("제목을 입력하세요: ");
        String title = scanner.nextLine();
        if (title.isEmpty()) {
            System.out.println("제목은 필수 입력사항입니다.");
            return;
        }

        // 저자 입력
        System.out.print("저자를 입력하세요: ");
        String author = scanner.nextLine();
        if (author.isEmpty()) {
            System.out.println("저자는 필수 입력사항입니다.");
            return;
        }

        // 출판사 입력
        System.out.print("출판사를 입력하세요: ");
        String publisher = scanner.nextLine();
        if (publisher.isEmpty()) {
            System.out.println("출판사는 필수 입력사항입니다.");
            return;
        }

        // 출판일 입력 및 유효성 검사
        System.out.print("출판일을 yyyy-MM-dd 형식으로 입력하세요: ");
        String publicationDateStr = scanner.nextLine();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false); // 엄격한 날짜 검사
        try {
            dateFormat.parse(publicationDateStr); // 날짜 파싱
        } catch (ParseException e) {
            System.out.println("잘못된 날짜 형식입니다. yyyy-MM-dd 형식으로 입력하세요.");
            return;
        }

        // 가격 입력 및 유효성 검사
        System.out.print("가격을 입력하세요: ");
        double price = -1;
        try {
            price = Double.parseDouble(scanner.nextLine());
            if (price <= 0) {
                System.out.println("가격은 0보다 커야 합니다.");
                return;
            }
        } catch (NumberFormatException e) {
            System.out.println("가격은 숫자로 입력해야 합니다.");
            return;
        }

        // 도서 등록 성공 메시지
        System.out.println("도서 등록이 완료되었습니다.");
        System.out.println("제목: " + title);
        System.out.println("저자: " + author);
        System.out.println("출판사: " + publisher);
        System.out.println("출판일: " + publicationDateStr);
        System.out.println("가격: " + price);
        
        scanner.close();
    }
}
