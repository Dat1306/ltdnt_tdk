
import 'package:calculator_project/controller/data.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

// Controller cho việc tính toán
class CalculateController extends GetxController {

  // HÀM XỬ LÝ KHI NÚT BẰNG ĐƯỢC NHẤN
  equalPressed() {
    // Sao chép chuỗi người dùng nhập để xử lý
    String userInputFC = Data.userInput;
    // Thay thế ký tự 'x' bằng '*' để phù hợp với cú pháp toán học
    userInputFC = userInputFC.replaceAll("x", "*");
    
    // Tạo parser để phân tích biểu thức
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    
    // Tạo mô hình ngữ cảnh để đánh giá biểu thức
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx); //Phương thức evaluate() trả về kết quả của phép tính dưới dạng một số thực.

    // Lưu kết quả vào biến đầu ra của người dùng
    Data.userOutput = eval.toString();
    update(); // Cập nhật UI
  }

  // HÀM XỬ LÝ KHI NÚT DEL ĐƯỢC NHẤN 
  deleteBtnAction() {
    // Loại bỏ ký tự cuối cùng từ chuỗi người dùng nhập
    Data.userInput = Data.userInput.substring(0, Data.userInput.length - 1);
    update(); // Cập nhật UI
  }

  // HÀM XỬ LÝ KHI NÚT XÓA HẾT ĐƯỢC NHẤN
  clearInputAndOutput() {
    // XÓA HẾT, ĐẶT TRẠNG THÁI VỀ MẶC ĐỊNH 
    Data.userInput = "";
    Data.userOutput = "";
    update(); // Cập nhật UI
  }

  // HÀM XỬ LÍ KHI NHẤN CÁC NÚT + - *  / , CÁC CON SỐ
    onBtnTapped(String value) {
  // Thêm số hoặc toán tử vào chuỗi người dùng
    Data.userInput += (value == "e") ? "2.71828182846" : value; // ví dụ: chuỗi 7*9
    update(); // Cập nhật UI
  }
  }