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

// 장터 정보 로드
async function loadStoreData(storeId) {
    const store = await storeService.getOne(storeId);
    // 모달에 데이터 채우기
    document.getElementById('store-edit-id').value = store.id;
    document.getElementById('store-edit-name').value = store.storeName;
    document.getElementById('store-edit-region').value = store.storeRegion;
    document.getElementById('store-edit-location').value = store.storeLocation;
    // ... 나머지 필드들
}
