// ################################# 회원 관리 이벤트 #################################

// 무한 스크롤 페이징 처리
let userPage = 1;
let userCheckScroll = true;
let userCriteria = null;

// 검색 필터 요소
const userKeyword = document.getElementById('user-keyword');

// 초기 로딩 - DOMContentLoaded 이벤트 이후에 실행
document.addEventListener('DOMContentLoaded', async () => {
    if (userKeyword) {
        userCriteria = await userService.getList(userPage, {
            keyword: userKeyword.value || '',
            userType: typeof selectedUserType !== 'undefined' ? selectedUserType : '',
            userState: typeof selectedUserState !== 'undefined' ? selectedUserState : ''
        }, userLayout.showList);
    }
});

// 무한 스크롤 이벤트
window.addEventListener("scroll", async (e) => {
    if (!userCheckScroll || !userCriteria?.hasMore) {
        return;
    }

    const scrollCurrentPosition = window.scrollY;
    const windowHeight = window.innerHeight;
    const documentHeight = document.documentElement.scrollHeight;

    // 바닥에 닿았을 때
    if (scrollCurrentPosition + windowHeight >= documentHeight - 1) {
        userCheckScroll = false;
        userCriteria = await userService.getList(++userPage, {
            keyword: userKeyword?.value || '',
            userType: typeof selectedUserType !== 'undefined' ? selectedUserType : '',
            userState: typeof selectedUserState !== 'undefined' ? selectedUserState : ''
        }, userLayout.showList);
    }

    setTimeout(() => {
        userCheckScroll = true;
    }, 1000);
});

// 검색 버튼 클릭 이벤트
const userSearchBtn = document.getElementById('user-search-btn');
if (userSearchBtn) {
    userSearchBtn.addEventListener('click', async () => {
        userPage = 1;
        userCriteria = await userService.getList(userPage, {
            keyword: userKeyword?.value || '',
            userType: typeof selectedUserType !== 'undefined' ? selectedUserType : '',
            userState: typeof selectedUserState !== 'undefined' ? selectedUserState : ''
        }, userLayout.showList);
    });
}

// 회원 수정 버튼 클릭 이벤트
document.addEventListener('click', (e) => {
    if (e.target.classList.contains('user-edit-btn')) {
        const row = e.target.closest('.user-row');
        if (row) {
            // row의 data attribute에서 직접 데이터 가져오기
            const user = {
                id: row.dataset.id,
                userName: row.dataset.name,
                userEmail: row.dataset.email,
                userPhone: row.dataset.phone,
                userType: row.dataset.type,
                userState: row.dataset.state,
                createdDatetime: row.dataset.created,
                updatedDatetime: row.dataset.updated,
                userLatestLogin: row.dataset.latestLogin
            };
            // 모달 열기
            openModal('user-edit');
            // 회원 정보 로드
            loadUserDataFromRow(user);
        }
    }
});

// 회원 정보 로드 (row에서 직접)
function loadUserDataFromRow(user) {
    // 라벨 매핑
    const typeLabels = {
        'NORMAL': '구매자',
        'SELLER': '판매자',
        'ADMIN': '관리자',
        'buyer': '구매자',
        'seller': '판매자',
        'admin': '관리자'
    };
    const stateLabels = {
        'active': '활성',
        'inactive': '비활성',
        'banned': '정지',
        'ACTIVE': '활성',
        'INACTIVE': '비활성',
        'BANNED': '정지'
    };

    // 모달에 데이터 채우기
    document.getElementById('user-edit-id').value = user.id || '';
    document.getElementById('user-edit-name').value = user.userName || '';
    document.getElementById('user-edit-email').value = user.userEmail || '';
    document.getElementById('user-edit-phone').value = user.userPhone || '';

    // 회원 유형 - data-actual-value 설정
    const typeInput = document.getElementById('user-edit-type');
    if (typeInput) {
        const typeLabel = typeLabels[user.userType] || user.userType || '';
        typeInput.value = typeLabel;
        typeInput.dataset.actualValue = user.userType || '';
    }

    // 상태 - data-actual-value 설정
    const stateInput = document.getElementById('user-edit-state');
    if (stateInput) {
        const stateLabel = stateLabels[user.userState] || user.userState || '';
        stateInput.value = stateLabel;
        stateInput.dataset.actualValue = user.userState || '';
    }

    // 가입일
    const createdAtInput = document.getElementById('user-edit-createdAt');
    if (createdAtInput) {
        createdAtInput.value = user.createdDatetime || '';
    }

    // 최근 로그인
    const latestLoginInput = document.getElementById('user-edit-latestLogin');
    if (latestLoginInput) {
        latestLoginInput.value = user.userLatestLogin || '';
    }

    // 회원번호만 비활성화, 나머지는 활성화
    const modal = document.querySelector('[name="user-edit"]');
    if (modal) {
        modal.querySelectorAll('.EditModal-Input').forEach(input => {
            const parent = input.closest('.EditModal-InputContent, .EditModal-SelectContent');

            // 회원번호, 가입일, 최근 로그인은 항상 비활성화
            if (input.id.endsWith('-id') || input.id.endsWith('-createdAt') || input.id.endsWith('-latestLogin')) {
                input.disabled = true;
                if (parent) parent.classList.add('disabled');
            } else {
                // 나머지는 활성화
                input.disabled = false;
                if (parent) parent.classList.remove('disabled');
            }
        });

        // 수정 버튼 숨기고 저장 버튼 표시
        const editBtn = modal.querySelector('.EditModal-Button.Edit');
        const saveBtn = modal.querySelector('.EditModal-Button.Save');
        if (editBtn) editBtn.style.display = 'none';
        if (saveBtn) saveBtn.style.display = '';
    }
}

// 저장 버튼 클릭 이벤트 (DOMContentLoaded 이후에 등록)
document.addEventListener('DOMContentLoaded', () => {
    const saveBtn = document.getElementById('user-save-btn');

    if (saveBtn) {
        saveBtn.addEventListener('click', async () => {
            const userId = document.getElementById('user-edit-id').value;
            const userName = document.getElementById('user-edit-name').value;
            const userEmail = document.getElementById('user-edit-email').value;
            const userPhone = document.getElementById('user-edit-phone').value;

            // data-actual-value에서 실제 값 가져오기
            const userType = document.getElementById('user-edit-type').dataset.actualValue || '';
            const userState = document.getElementById('user-edit-state').dataset.actualValue || '';

            // 유효성 검사
            if (!userName || !userEmail || !userPhone) {
                alert('모든 필드를 입력해주세요.');
                return;
            }

            const userData = {
                id: userId,
                userName: userName,
                userEmail: userEmail,
                userPhone: userPhone,
                userType: userType,
                userState: userState
            };

            try {
                await userService.update(userData);
                alert('회원 정보가 수정되었습니다.');

                // 모달 닫기
                closeModal('user-edit');

                // 목록 새로고침
                userPage = 1;
                userCriteria = await userService.getList(userPage, {
                    keyword: userKeyword?.value || '',
                    userType: typeof selectedUserType !== 'undefined' ? selectedUserType : '',
                    userState: typeof selectedUserState !== 'undefined' ? selectedUserState : ''
                }, userLayout.showList);
            } catch (error) {
                alert('회원 정보 수정에 실패했습니다.');
                console.error(error);
            }
        });
    }
});
