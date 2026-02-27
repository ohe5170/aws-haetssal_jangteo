const storeLayout = (() => {
    const storeStateToLabel = { pending: '심사중', denied: '심사반려', open: '운영중', close: '운영중단' };

    const showList = (storeWithPaging) => {
        const listContainer = document.getElementById('store-list');
        const totalEl = document.getElementById('store-total');
        const pagination = document.getElementById('store-pagination');

        const stores = storeWithPaging.stores || [];
        const criteria = storeWithPaging.criteria;

        if (totalEl) totalEl.textContent = storeWithPaging.total ?? 0;

        if (stores.length === 0) {
            listContainer.innerHTML = '<p class="EmptyMessage">등록된 가게가 없습니다.</p>';
            if (pagination) pagination.innerHTML = '';
            return criteria;
        }

        let text = '';
        stores.forEach((store) => {
            const stateVal = store.storeState?.value || store.storeState || '';
            text += `
                <div class="MainContent-ItemList store-row"
                     data-id="${store.id}"
                     data-name="${store.storeName || ''}"
                     data-region="${store.storeRegion || ''}"
                     data-location="${store.storeLocation || ''}"
                     data-state="${stateVal}"
                     data-created="${store.createdDatetime || ''}"
                     data-updated="${store.updatedDatetime || ''}">
                    <div class="ItemList-MainRightInfo">
                        <div class="ItemList-MainInfoList">
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">가게 번호</p>
                                <p class="MainInfoList-Value">${store.id}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">가게 이름</p>
                                <p class="MainInfoList-Value">${store.storeName || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">위치</p>
                                <p class="MainInfoList-Value">${store.storeLocation || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">지역</p>
                                <p class="MainInfoList-Value">${store.storeRegion || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">상태</p>
                                <p class="MainInfoList-Value">${storeStateToLabel[stateVal] || stateVal || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">등록일</p>
                                <p class="MainInfoList-Value">${store.createdDatetime || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">정보 수정일</p>
                                <p class="MainInfoList-Value">${store.updatedDatetime || '-'}</p>
                            </div>
                        </div>
                        <button type="button" class="Row-EditBtn store-edit-btn">수정</button>
                    </div>
                </div>
            `;
        });

        if (criteria && criteria.page === 1) {
            listContainer.innerHTML = text;
        } else {
            listContainer.innerHTML += text;
        }

        return criteria;
    };

    return { showList };
})();
