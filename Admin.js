const form = document.getElementById("form")

form.addEventListener("submit", function(event){
    event.preventDefault()

    
    let userId = event.target.id.value
    let userPw1 = event.target.pw1.value
    let userPw2 = event.target.pw2.value
    let userName = event.target.name.value
    let userPhone = event.target.phone.value
    let userGender = event.target.gender.value
    let userEmail = event.target.email.value    

    if(userId.length < 6){
        alert("아이디가 너무 짧습니다. 6자 이상 입력해주세요.")
        return
    }

    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userPw1)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#userPw1').val('').focus();
        return false;
    }    
    var checkNumber = userPw1.search(/[0-9]/g);
    var checkEnglish = userPw1.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#userPw1').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(userPw1)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#userPw1').val('').focus();
        return false;
    }        

    if(userPw1 !== userPw2){
        alert("비밀번호가 일치하지 않습니다.")
        return
    }

    let userInfo = `
    아이디 : ${userId}
    이름 : ${userName}
    휴대전화 번호: ${userPhone}
    성별: ${userGender}
    이메일: ${userEmail}`;

    alert("회원가입이 완료되었습니다." + userInfo);

    window.location.href = "NewAdmin.html";

})


function darkMode() {
    let mode = document.documentElement.getAttribute("data-bs-theme");

    if (mode === 'dark') {
        document.documentElement.setAttribute("data-bs-theme", "light");
        document.getElementById('darkBtn').innerText = '다크모드 전환';
    } else {
        document.documentElement.setAttribute("data-bs-theme", "dark");
        document.getElementById('darkBtn').innerText = '라이트모드 전환';
    }
}

