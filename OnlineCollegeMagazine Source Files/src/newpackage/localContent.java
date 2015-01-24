package newpackage;


import java.util.HashMap;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Director IMU-KOL
 */
public class localContent {
    public HashMap<String,String> getLang(String lang){
        HashMap<String,String> eng2lang=new HashMap<String,String>();
        
        /*------FOR BENGALI---------------*/
        
        if(lang.equals("bng")){
        
        eng2lang.put("Home", "মূল পাতা");
        eng2lang.put("Login", "লগইন");
        eng2lang.put("Logout", "লগ আউট");
        eng2lang.put("First Name","প্রথম নাম");
        eng2lang.put("Last Name","শেষ নাম ");
        eng2lang.put("Category","বিভাগ");
        eng2lang.put("CATEGORY", "বিভাগ");
        eng2lang.put("Sorry there are no articles to be displayed under this category.", "দুঃখিত, কোন নিবন্ধ এই বিভাগের অধিনে নেই");
        eng2lang.put("ARTICLE COUNT","নিবন্ধ গণনা");
        eng2lang.put("Email","ই- মেইল");
        eng2lang.put("Download","ডাউনলড");
        eng2lang.put("DOWNLOAD COUNT","ডাউনলড গননা");
        eng2lang.put("Register","নিবন্ধীকরণ");
        eng2lang.put("Profile","পরিলেখ");
        eng2lang.put("Authors","লেখক সমূহ");
        eng2lang.put("Articles","প্রবন্ধ সমূহ");
        eng2lang.put("Editor","সম্পাদকের বার্তা");
        eng2lang.put("Author","লেখক");
        eng2lang.put("Name","প্রবন্ধ");
        eng2lang.put("Keyword","কিওয়ার্ড");
        eng2lang.put("Thank You for rating","রেটিং এর জন্য ধন্যবাদ");
        eng2lang.put("AUTHOR NAME","লেখকের নাম");
        eng2lang.put("ARTICLE NAME","প্রবন্ধের নাম");
        eng2lang.put("Editor's Pick", "সম্পাদক এর নির্বাচিত প্রবন্ধ");
        eng2lang.put("Archive","অতীতের প্রাকাশনা সমূহ");
 eng2lang.put("Sorry","দুঃখিত! এই বিভাগে কোন প্রবন্ধ নেই");
        eng2lang.put("Top Rated Articles","রেটিং এর শীর্ষে থাকা প্রবন্ধ সমূহ");
        eng2lang.put("View Count","প্রবন্ধটি পড়া হয়েছে এত বার");
        eng2lang.put("VIEW COUNT", "দেখবার গননা");
        eng2lang.put("RATING", "স্টার রেটিং");
        eng2lang.put("NO RESULTS FOUND", "দুঃখিত! এইরকম কোন প্রবন্ধ পাওয়া জায়নি");
        eng2lang.put("Next", "পরের পৃষ্ঠা");
        eng2lang.put("Previous","আগের পৃষ্ঠা");
        eng2lang.put("Magazine Articles", "পত্রিকার নিবন্ধ তালিকা");
        eng2lang.put("Current Issue", " বর্তমান সংস্করণ নাম");
        eng2lang.put("NEXT COMMENTS", "পরের মন্তব্য");
        eng2lang.put("PREVIOUS COMMENTS", "আগের মন্তব্য");
        eng2lang.put("Department","দপ্তর");
        eng2lang.put("Computer Science and Engineering", "কম্পিউটার বিজ্ঞান ও প্রকৌশল");
        eng2lang.put("Electronics and Communications Engineering","ইলেকট্রনিক্স ও যোগাযোগ প্রকৌশল");
        eng2lang.put("Information Technology", "তথ্য প্রযুক্তি");
        eng2lang.put("Password", "পাসওয়ার্ড");
        eng2lang.put("HELP", "সাহায্য");
        eng2lang.put("Password must follow these rules.", "পাসওয়ার্ড এই নিয়ম অনুসরণ করা আবশ্যক");
        eng2lang.put("Its length should be greater than 6.", "এর দৈর্ঘ্য 6 এর বেশি হওয়া উচিত");
        eng2lang.put("It should have lower & uppercase characters.", "এটি নিম্ন 'য়ের বড়হাতের অক্ষর ছোটহাতের অক্ষর থাকা আবশ্যক");
        eng2lang.put("It should have at least one number.", "এটির অন্তত একটি নম্বর থাকা উচিত");
        eng2lang.put("It should have at least one special character.", "এটির অন্তত একটি বিশেষ অক্ষর থাকা আবশ্যক");
        eng2lang.put("Password strength", "পাসওয়ার্ডের ক্ষমতা");
        eng2lang.put("Password not entered", "পাসওয়ার্ড দেওা হয়নি");
        eng2lang.put("Confirm Password", "পাসওয়ার্ড নিশ্চিত করুন");
        eng2lang.put("Type", "প্রকার");
        eng2lang.put("Student", "ছাত্র");
        eng2lang.put("Faculty", "শিক্ষক");
        eng2lang.put("Alumni", "প্রাক্তন ছাত্র");
        eng2lang.put("First", "প্রথম");
        eng2lang.put("Second", "দ্বিতিয়");
        eng2lang.put("Third", "তৃতীয়");
        eng2lang.put("Fourth", "চতুর্থ");
        eng2lang.put("(Fields marked * are mandatory)", "(* চিহ্নিত ক্ষেত্র বাধ্যতামূলক)");
        }
        if(lang.equals("eng")){
        	eng2lang.put("Home", "Home");
            eng2lang.put("Login", "Login");
            eng2lang.put("Logout", "Logout");
            eng2lang.put("First Name","First Name");
            eng2lang.put("Last Name","Last Name");
            eng2lang.put("Category","Category");
            eng2lang.put("CATEGORY", "CATEGORY");
            eng2lang.put("Sorry there are no articles to be displayed under this category.", "Sorry there are no articles to be displayed under this category.");
            eng2lang.put("ARTICLE COUNT","ARTICLE COUNT");
            eng2lang.put("Email","Email");
            eng2lang.put("Download","Download");
            eng2lang.put("DOWNLOAD COUNT","DOWNLOAD COUNT");
            eng2lang.put("Register","Register");
            eng2lang.put("Profile","Profile");
            eng2lang.put("Authors","Authors");
            eng2lang.put("Articles","Articles");
            eng2lang.put("Editor","Editor");
            eng2lang.put("Author","Author");
            eng2lang.put("Name","Name");
            eng2lang.put("Keyword","Keyword");
            eng2lang.put("Thank You for rating","Thank You for rating");
            eng2lang.put("AUTHOR NAME","AUTHOR NAME");
            eng2lang.put("ARTICLE NAME","ARTICLE NAME");
            eng2lang.put("Editor's Pick", "Editor's Pick");
            eng2lang.put("Archive","Archive");
     eng2lang.put("Sorry","Sorry");
            eng2lang.put("Top Rated Articles","Top Rated Articles");
            eng2lang.put("View Count","View Count");
            eng2lang.put("VIEW COUNT", "VIEW COUNT");
            eng2lang.put("RATING", "RATING");
            eng2lang.put("NO RESULTS FOUND", "NO RESULTS FOUND");
            eng2lang.put("Next", "Next");
            eng2lang.put("Previous","Previous");
            eng2lang.put("Magazine Articles", "Magazine Articles");
            eng2lang.put("Current Issue", "Current Issue");
            eng2lang.put("NEXT COMMENTS", "NEXT COMMENTS");
            eng2lang.put("PREVIOUS COMMENTS", "PREVIOUS COMMENTS");
            eng2lang.put("Department","Department");
            eng2lang.put("Computer Science and Engineering", "Computer Science and Engineering");
            eng2lang.put("Electronics and Communications Engineering","Electronics and Communications Engineering");
            eng2lang.put("Information Technology", "Information Technology");
            eng2lang.put("Password", "Password");
            eng2lang.put("HELP", "HELP");
            eng2lang.put("Password must follow these rules.", "Password must follow these rules.");
            eng2lang.put("Its length should be greater than 6.", "Its length should be greater than 6.");
            eng2lang.put("It should have lower & uppercase characters.", "It should have lower & uppercase characters.");
            eng2lang.put("It should have at least one number.", "It should have at least one number.");
            eng2lang.put("It should have at least one special character.", "It should have at least one special character.");
            eng2lang.put("Password strength", "Password strength");
            eng2lang.put("Password not entered", "Password not entered");
            eng2lang.put("Confirm Password", "Confirm Password");
            eng2lang.put("Type", "Type");
            eng2lang.put("Student", "Student");
            eng2lang.put("Faculty", "Faculty");
            eng2lang.put("Alumni", "Alumni");
            eng2lang.put("First", "First");
            eng2lang.put("Second", "Second");
            eng2lang.put("Third", "Third");
            eng2lang.put("Fourth", "Fourth");
            eng2lang.put("(Fields marked * are mandatory)", "(Fields marked * are mandatory)");
        }
        if(lang.equals("hind")){
        	 eng2lang.put("Home", "मुखपृष्ठ");
             eng2lang.put("Login", "लॉग इन");
             eng2lang.put("Logout", "लॉग आउट");
             eng2lang.put("First Name","प्रथम नाम");
             eng2lang.put("Last Name","अंतिम नाम ");
             eng2lang.put("Category","अनुभाग");
             eng2lang.put("CATEGORY", "अनुभाग");
             eng2lang.put("Sorry there are no articles to be displayed under this category.", "क्षमा करें, इस खंड के अंतर्गत कोई लेख नहीं");
             eng2lang.put("ARTICLE COUNT","लेख गिनती");
             eng2lang.put("Email","ई - मेल");
             eng2lang.put("Download","डाउनलोड");
             eng2lang.put("DOWNLOAD COUNT","डाउनलोड गणना");
             eng2lang.put("Register","पंजीकरण");
             eng2lang.put("Profile","प्रोफ़ाइल");
             eng2lang.put("Authors","लेखक");
             eng2lang.put("Articles","लेख");
             eng2lang.put("Editor","संपादक संदेश");
             eng2lang.put("Author","लेखक");
             eng2lang.put("Name","लेख");
             eng2lang.put("Keyword","कीवर्ड");
             eng2lang.put("Thank You for rating","रेटिंग के लिए धन्यवाद");
             eng2lang.put("AUTHOR NAME","लेखक का नाम");
             eng2lang.put("ARTICLE NAME","लेख का नाम");
             eng2lang.put("Editor's Pick", "संपादक निर्वाचित लेख");
             eng2lang.put("Archive","संग्रह");
      eng2lang.put("Sorry","क्षमा करें! इस खंड में कोई लेख नहीं हैं");
             eng2lang.put("Top Rated Articles","मुख्य रेटेड लेख");
             eng2lang.put("View Count","देखने की गणना");
             eng2lang.put("VIEW COUNT", "देखने की गणना");
             eng2lang.put("RATING", "स्टार रेटिंग");
             eng2lang.put("NO RESULTS FOUND", "क्षमा करें!कोई लेख नहीं मिला");
             eng2lang.put("Next", "अगले पृष्ठ");
             eng2lang.put("Previous","पिछले पृष्ठ");
             eng2lang.put("Magazine Articles", "पत्रिका लेख की सूची");
             eng2lang.put("Current Issue", " वर्तमान संस्करण नाम");
             eng2lang.put("NEXT COMMENTS", "अगली टिप्पणी");
             eng2lang.put("PREVIOUS COMMENTS", "पिछले टिप्पणी");
             eng2lang.put("Department","Department");
             eng2lang.put("Computer Science and Engineering", "Computer Science and Engineering");
             eng2lang.put("Electronics and Communications Engineering","Electronics and Communications Engineering");
             eng2lang.put("Information Technology", "Information Technology");
             eng2lang.put("Password", "Password");
             eng2lang.put("HELP", "HELP");
             eng2lang.put("Password must follow these rules.", "Password must follow these rules.");
             eng2lang.put("Its length should be greater than 6.", "Its length should be greater than 6.");
             eng2lang.put("It should have lower & uppercase characters.", "It should have lower & uppercase characters.");
             eng2lang.put("It should have at least one number.", "It should have at least one number.");
             eng2lang.put("It should have at least one special character.", "It should have at least one special character.");
             eng2lang.put("Password strength", "Password strength");
             eng2lang.put("Password not entered", "Password not entered");
             eng2lang.put("Confirm Password", "Confirm Password");
             eng2lang.put("Type", "Type");
             eng2lang.put("Student", "Student");
             eng2lang.put("Faculty", "Faculty");
             eng2lang.put("Alumni", "Alumni");
             eng2lang.put("First", "First");
             eng2lang.put("Second", "Second");
             eng2lang.put("Third", "Third");
             eng2lang.put("Fourth", "Fourth");
             eng2lang.put("(Fields marked * are mandatory)", "(Fields marked * are mandatory)");
        }
        return eng2lang;
    }
    
}
