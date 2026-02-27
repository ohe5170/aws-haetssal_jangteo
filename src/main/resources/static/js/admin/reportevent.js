// ################################# 신고 관리 이벤트 #################################

// 값 → 한국어 레이블 변환
const reportTypeToLabel = {
    ITEM: '상품',
    USER: '회원',
    MARKET: '마켓',
    SELLER: '판매자'
};

// 검색 필터 요소
const reportKeyword = document.getElementById('report-keyword');

// ===== 신고 유형 드롭다운 =====
const reportTypeWrapper = document.getElementById('reportTypeSelectWrapper');
const reportTypeOption = document.getElementById('reportTypeSelectOption');
const reportTypeValueEl = document.getElementById('reportTypeValue');
let selectedReportType = '';

function initReportTypeDropdown() {
    if (!reportTypeWrapper || !reportTypeOption || !reportTypeValueEl) return;

    reportTypeWrapper.addEventListener('click', (e) => {
        reportTypeOption.classList.toggle('off');
        e.stopPropagation();
    });

    document.querySelectorAll('#reportTypeSelectOption .SelectBody-OptionValue').forEach(opt => {
        opt.addEventListener('click', (e) => {
            selectedReportType = opt.dataset.value;
            reportTypeValueEl.textContent = opt.textContent.trim();
            reportTypeOption.classList.add('off');
            e.stopPropagation();
        });
    });

    document.getElementById('reportTypeAllBtn')?.addEventListener('click', (e) => {
        selectedReportType = '';
        reportTypeValueEl.textContent = '전체';
        reportTypeOption.classList.add('off');
        e.stopPropagation();
    });
}

// ===== 신고 대상 유형 드롭다운 =====
const reportTargetWrapper = document.getElementById('reportTargetSelectWrapper');
const reportTargetOption = document.getElementById('reportTargetSelectOption');
const reportTargetValueEl = document.getElementById('reportTargetValue');
let selectedReportTarget = '';

function initReportTargetDropdown() {
    if (!reportTargetWrapper || !reportTargetOption || !reportTargetValueEl) return;

    reportTargetWrapper.addEventListener('click', (e) => {
        reportTargetOption.classList.toggle('off');
        e.stopPropagation();
    });

    document.querySelectorAll('#reportTargetSelectOption .SelectBody-OptionValue').forEach(opt => {
        opt.addEventListener('click', (e) => {
            selectedReportTarget = opt.dataset.value;
            reportTargetValueEl.textContent = opt.textContent.trim();
            reportTargetOption.classList.add('off');
            e.stopPropagation();
        });
    });

    document.getElementById('reportTargetAllBtn')?.addEventListener('click', (e) => {
        selectedReportTarget = '';
        reportTargetValueEl.textContent = '전체';
        reportTargetOption.classList.add('off');
        e.stopPropagation();
    });
}

// 드롭다운 외부 클릭 시 닫기
function initReportDropdownCloseOnOutsideClick() {
    document.addEventListener('click', () => {
        reportTypeOption?.classList.add('off');
        reportTargetOption?.classList.add('off');
    });
}

// 무한 스크롤 페이징 처리
let reportPage = 1;
let reportCheckScroll = true;
let reportCriteria = null;

// 초기 로딩
if (reportKeyword) {
    reportCriteria = reportService.getList(reportPage, {
        keyword: reportKeyword.value || '',
        reportType: selectedReportType || ''
    }, reportLayout.showList);
}

// 무한 스크롤 이벤트
window.addEventListener("scroll", async (e) => {
    if (!reportCheckScroll || !reportCriteria?.hasMore) {
        return;
    }

    const scrollCurrentPosition = window.scrollY;
    const windowHeight = window.innerHeight;
    const documentHeight = document.documentElement.scrollHeight;

    // 바닥에 닿았을 때
    if (scrollCurrentPosition + windowHeight >= documentHeight - 1) {
        reportCheckScroll = false;
        reportCriteria = await reportService.getList(++reportPage, {
            keyword: reportKeyword?.value || '',
            reportType: selectedReportType || ''
        }, reportLayout.showList);
    }

    setTimeout(() => {
        reportCheckScroll = true;
    }, 1000);
});

// 검색 버튼 클릭 이벤트
const reportSearchBtn = document.getElementById('report-search-btn');
if (reportSearchBtn) {
    reportSearchBtn.addEventListener('click', async () => {
        reportPage = 1;
        reportCriteria = await reportService.getList(reportPage, {
            keyword: reportKeyword?.value || '',
            reportType: selectedReportType || ''
        }, reportLayout.showList);
    });
}

// 신고 상세 버튼 클릭 이벤트
document.addEventListener('click', (e) => {
    if (e.target.classList.contains('report-detail-btn')) {
        const row = e.target.closest('.report-row');
        if (row) {
            // 모달 열기
            openModal('report-edit');
            // 신고 정보 로드
            loadReportData(row);
        }
    }
});

// 신고 정보 로드
function loadReportData(row) {
    const reportTypeToLabel = {
        ITEM: '상품',
        USER: '회원',
        MARKET: '마켓',
        SELLER: '판매자'
    };

    document.getElementById('report-edit-id').value = row.dataset.id || '';
    document.getElementById('report-edit-type').value = reportTypeToLabel[row.dataset.type] || row.dataset.type || '';
    document.getElementById('report-edit-reporter-name').value = row.dataset.reporterName || '';
    document.getElementById('report-edit-reporter-email').value = row.dataset.reporterEmail || '';
    document.getElementById('report-edit-target-id').value = row.dataset.reporterId || '';
    document.getElementById('report-edit-date').value = row.dataset.created || '';
}

// 모달 닫기 버튼
const reportModal = document.querySelector('[name="report-edit"]');
if (reportModal) {
    const closeBtn = reportModal.querySelector('.EditModal-CloseButton');
    const closeBottomBtn = reportModal.querySelector('.EditModal-Button.Close');

    if (closeBtn) {
        closeBtn.addEventListener('click', () => {
            closeModal('report-edit');
        });
    }

    if (closeBottomBtn) {
        closeBottomBtn.addEventListener('click', () => {
            closeModal('report-edit');
        });
    }
}

// 초기화 함수
function initReportPageEvents() {
    initReportTypeDropdown();
    initReportTargetDropdown();
    initReportDropdownCloseOnOutsideClick();
}

// DOMContentLoaded 이벤트에서 초기화
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initReportPageEvents);
} else {
    initReportPageEvents();
}
