package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.Student;
import utils.DBUtil;

public class StudentValidator {
    public static List<String> validate(Student e, Boolean codeDuplicateCheckFlag, Boolean passwordCheckFlag) {
        List<String> errors = new ArrayList<String>();

        String code_error = validateCode(e.getCode(), codeDuplicateCheckFlag);
        if(!code_error.equals("")) {
            errors.add(code_error);
        }

        String code_error2 = validateCode2(e.getCode());
        if(!code_error2.equals("")) {
            errors.add(code_error2);
        }

        String name_error = validateName(e.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String faculty_error = validateFaculty(e.getFaculty());
        if(!faculty_error.equals("")) {
            errors.add(faculty_error);
        }

        String department_error = validateDepartment(e.getDepartment());
        if(!department_error.equals("")) {
            errors.add(department_error);
        }

        String password_error = validatePassword(e.getPassword(), passwordCheckFlag);
        if(!password_error.equals("")) {
            errors.add(password_error);
        }






        return errors;
    }

    // 社員番号
    private static String validateCode(String code, Boolean codeDuplicateCheckFlag) {
        // 必須入力チェック
        if(code == null || code.equals("")) {
            return "IDを入力してください。";
        }

        // すでに登録されている社員番号との重複チェック
        if(codeDuplicateCheckFlag) {
            EntityManager em = DBUtil.createEntityManager();
            long students_count = (long)em.createNamedQuery("checkRegisteredCode", Long.class).setParameter("code", code).getSingleResult();
            em.close();
            if(students_count > 0) {
                return "入力されたIDの情報はすでに存在しています。";
            }
        }

        return "";
    }
    private static String validateCode2(String code) {
        if(!code.matches("^[0-9]*$")) {
            return "半角数字以外は使えません。";
        }

        return "";
    }


    // 社員名の必須入力チェック
    private static String validateName(String name) {
        if(name == null || name.equals("")) {
            return "氏名を入力してください。";
        }

        return "";
    }

    private static String validateFaculty(String faculty) {
        if(faculty == null || faculty.equals("")) {
            return "学部を選択してください。";
        }

        return "";
    }

    private static String validateDepartment(String department) {
        if(department == null || department.equals("")) {
            return "学科を選択してください。";
        }

        return "";
    }


    // パスワードの必須入力チェック
    private static String validatePassword(String password, Boolean passwordCheckFlag) {
        // パスワードを変更する場合のみ実行
        if(passwordCheckFlag && (password == null || password.equals(""))) {
            return "パスワードを入力してください。";
        }
        return "";
    }







}