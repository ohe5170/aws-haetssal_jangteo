// ################################# 장터 관리 이벤트 #################################

// 무한 스크롤 페이징 처리
let storePage = 1;
let storeCheckScroll = true;
let storeCriteria = null;

// 검색 필터 요소
const storeKeyword = document.getElementById('store-keyword');
const storeRegion = document.getElementById('store-region');
const storeState = document.getElementById('store-state');

// 초기 로딩
if (storeKeyword) {
    storeCriteria = storeService.getList(storePage, {
        keyword: storeKeyword.value || '',
        region: storeRegion?.value || '',
        state: storeState?.value || ''
    }, storeLayout.showList);
}

// 무한 스크롤 이벤트
window.addEventListener("scroll", async (e) => {
    if (!storeCheckScroll || !storeCriteria?.hasMore) {
        return;
    }

    const scrollCurrentPosition = window.scrollY;
    const windowHeight = window.innerHeight;
    const documentHeight = document.documentElement.scrollHeight;

    // 바닥에 닿았을 때
    if (scrollCurrentPosition + windowHeight >= documentHeight - 1) {
        storeCheckScroll = false;
        storeCriteria = await storeService.getList(++storePage, {
            keyword: storeKeyword?.value || '',
            region: storeRegion?.value || '',
            state: storeState?.value || ''
        }, storeLayout.showList);
    }

    setTimeout(() => {
        storeCheckScroll = true;
    }, 1000);
});

// 검색 버튼 클릭 이벤트
const storeSearchBtn = document.getElementById('store-search-btn');
if (storeSearchBtn) {
    storeSearchBtn.addEventListener('click', async () => {
        storePage = 1;
        storeCriteria = await storeService.getList(storePage, {
            keyword: storeKeyword?.value || '',
            region: storeRegion?.value || '',
            state: storeState?.value || ''
        }, storeLayout.showList);
    });
}

// 장터 수정 버튼 클릭 이벤트
document.addEventListener('click', (e) => {
    if (e.target.classList.contains('store-edit-btn')) {
        const row = e.target.closest('.store-row');
        if (row) {
            const storeId = row.dataset.id;
            // 모달 열기
            openModal('store-edit');
            // 장터 정보 로드
            loadStoreData(storeId);
        }
    }
});

// 가게 정보 로드
async function loadStoreData(storeId) {
    const store = await storeService.getOne(storeId);

    // 상태 레이블 매핑
    const stateLabels = {
        'pending': '심사중',
        'denied': '심사반려',
        'open': '운영중',
        'close': '운영중단'
    };

    // 모달에 데이터 채우기
    document.getElementById('store-id').value = store.id;
    document.getElementById('store-name').value = store.storeName || '';
    document.getElementById('store-category').value = store.storeCategoryName || '';
    document.getElementById('store-createdAt').value = store.createdDatetime || '';
    document.getElementById('store-updatedAt').value = store.updatedDatetime || '';

    // 상태 드롭다운
    const stateInput = document.getElementById('store-state');
    if (stateInput) {
        stateInput.value = stateLabels[store.storeState] || store.storeState;
        stateInput.dataset.actualValue = store.storeState;
    }

    // 지역 드롭다운
    const locationInput = document.getElementById('store-location');
    if (locationInput) {
        locationInput.value = store.storeAddress || '';
        locationInput.dataset.actualValue = store.storeAddress || '';
    }
}
