// 크롤링한 데이터를 아래와 같은 형태의 객체 배열로 가정합니다.
            // 추후 데이터베이스에 있는 데이터를 쿼리문으로 불러 올 수 있게 쿼리를 작성해 볼 수 있음

            // 현재 날짜 및 시간 기능 구현
            function updateDateTime() {
                const now = new Date();
                const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false };
                document.getElementById('currentDateTime').innerHTML = now.toLocaleDateString('ko-KR', options);
            }

            updateDateTime();
            setInterval(updateDateTime,1000);

            // 제품 데이터
            const product_data = [
            { category: "상의", brand: 'Supreme', product: '슈프림 박스로고 후드티', price: '390,000' },
            { category: "하의", brand: 'DIESEL', product: '디젤 트랙 팬츠', price: '188,000' },
            { category: "신발", brand: 'Nike', product: '에어포스 1', price: '137,000' },
            { category: "패션잡화", brand: 'Music&Goods', product: '빵빵이 키링', price: '29,000' },
            // ...
            ];

            // 제품 테이블에 데이터 추가
            const product_data_Table = document.getElementById('product_data_Table');

            // 초기 데이터 로딩
            product_data.forEach((item) => {
            const row = product_data_Table.insertRow();
            row.insertCell(0).innerHTML = item.category;
            row.insertCell(1).innerHTML = item.brand;
            row.insertCell(2).innerHTML = item.product;
            row.insertCell(3).innerHTML = item.price;
            });

            // 다크모드, 라이트 모드 전환
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