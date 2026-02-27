const storeService = (() => {

    // ===== 가게 목록 조회 =====
    const getList = async (page, search, callback) => {
        page = page || 1;
        const keyword = search?.keyword || "";
        const region = search?.region || "";
        const state = search?.state || "";

        let queryString = `?keyword=${encodeURIComponent(keyword)}`;
        queryString += `&region=${encodeURIComponent(region)}`;
        queryString += `&state=${encodeURIComponent(state)}`;

        const response = await fetch(`/api/admin/stores/${page}${queryString}`);
        const storeWithPaging = await response.json();

        if (callback) {
            return callback(storeWithPaging);
        }

        return storeWithPaging;
    };


    // ===== 가게 단건 조회 =====
    const getOne = async (id, callback) => {

        const response = await fetch(`/api/admin/stores/${id}`);
        const store = await response.json();

        if (callback) {
            return callback(store);
        }

        return store;
    };


    // ===== 가게 수정 =====
    const update = async (storeData, callback) => {

        const response = await fetch(`/api/admin/stores/${storeData.id}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(storeData)
        });

        const result = await response.json();

        if (callback) {
            return callback(result);
        }

        return result;
    };


    // ===== 가게 지역 목록 조회 =====
    const getRegions = async (callback) => {

        const response = await fetch(`/api/admin/stores/regions`);
        const regions = await response.json();

        if (callback) {
            return callback(regions);
        }

        return regions;
    };


    return {
        getList,
        getOne,
        update,
        getRegions
    };

})();
