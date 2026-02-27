const reportLayout = (() => {
    const reportTypeToLabel = {
        ITEM: '상품',
        USER: '회원',
        MARKET: '마켓',
        SELLER: '판매자'
    };

    const showList = (reportWithPaging) => {
        const listContainer = document.getElementById('report-list');
        const totalEl = document.getElementById('report-total');
        const pagination = document.getElementById('report-pagination');

        const reports = reportWithPaging.reports || [];
        const criteria = reportWithPaging.criteria;

        if (totalEl) totalEl.textContent = reportWithPaging.total ?? 0;

        if (reports.length === 0) {
            listContainer.innerHTML = '<p class="EmptyMessage">접수된 신고가 없습니다.</p>';
            if (pagination) pagination.innerHTML = '';
            return criteria;
        }

        let text = '';
        reports.forEach((report) => {
            const reportTypeVal = report.reportType || '';
            text += `
                <div class="MainContent-ItemList report-row"
                     data-id="${report.id}"
                     data-type="${reportTypeVal}"
                     data-reporter-id="${report.reportReporterId || ''}"
                     data-reporter-name="${report.reporterName || ''}"
                     data-reporter-email="${report.reporterEmail || ''}"
                     data-created="${report.createdDatetime || ''}">
                    <div class="ItemList-MainRightInfo">
                        <div class="ItemList-MainInfoList">
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">신고 번호</p>
                                <p class="MainInfoList-Value">${report.id}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">신고 유형</p>
                                <p class="MainInfoList-Value">${reportTypeToLabel[reportTypeVal] || reportTypeVal || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">신고자</p>
                                <p class="MainInfoList-Value">${report.reporterName || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">신고자 이메일</p>
                                <p class="MainInfoList-Value">${report.reporterEmail || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">신고 대상 번호</p>
                                <p class="MainInfoList-Value">${report.reportReporterId || '-'}</p>
                            </div>
                            <div class="MainInfoList-Wrapper">
                                <p class="MainInfoList-Field">신고 일시</p>
                                <p class="MainInfoList-Value">${report.createdDatetime || '-'}</p>
                            </div>
                        </div>
                        <button type="button" class="Row-EditBtn report-detail-btn">상세</button>
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
