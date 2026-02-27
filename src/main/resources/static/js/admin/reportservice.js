const reportService = (() => {

    // ===== 신고 목록 조회 =====
    const getList = async (page, search, callback) => {
        page = page || 1;
        const keyword = search?.keyword || "";
        const reportType = search?.reportType || "";

        let queryString = `?keyword=${encodeURIComponent(keyword)}`;
        queryString += `&reportType=${encodeURIComponent(reportType)}`;

        const response = await fetch(`/api/admin/reports/${page}${queryString}`);
        const reportWithPaging = await response.json();

        if (callback) {
            return callback(reportWithPaging);
        }

        return reportWithPaging;
    };


    // ===== 신고 상태 수정 =====
    const updateState = async (reportData, callback) => {

        const response = await fetch(`/api/admin/reports/${reportData.id}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reportData)
        });

        const result = await response.json();

        if (callback) {
            return callback(result);
        }

        return result;
    };


    return {
        getList,
        updateState
    };

})();
