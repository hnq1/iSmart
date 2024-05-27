import axios from "./axios"

const fetchDataStatisticalImportOrder = (minDate, maxDate, storageId) => {
    let url = 'api/Dashboard/get-data-import-by-date';
    if (minDate || maxDate || storageId) {
        url += '?';
        if (minDate) {
            url += `mindate=${minDate}`;
            if (maxDate) {
                url += `&maxdate=${maxDate}`;
                if (storageId) {
                    url += `&storageId=${storageId}`
                }
            }
        } else if (!minDate) {
            if (maxDate) {
                url += `maxdate=${maxDate}`;
                if (storageId) {
                    url += `&storageId=${storageId}`
                }
            } else {
                if (storageId) {
                    url += `storageId=${storageId}`
                }
            }

        }
    }
    return axios.get(url);
}

const fetchDataStatisticalExortOrder = (minDate, maxDate, storageId) => {
    let url = 'api/Dashboard/get-data-export-by-date';
    if (minDate || maxDate || storageId) {
        url += '?';
        if (minDate) {
            url += `mindate=${minDate}`;
            if (maxDate) {
                url += `&maxdate=${maxDate}`;
                if (storageId) {
                    url += `&storageId=${storageId}`
                }
            }
        } else if (!minDate) {
            if (maxDate) {
                url += `maxdate=${maxDate}`;
                if (storageId) {
                    url += `&storageId=${storageId}`
                }
            } else {
                if (storageId) {
                    url += `storageId=${storageId}`
                }
            }

        }
    }
    return axios.get(url);
}

export { fetchDataStatisticalImportOrder, fetchDataStatisticalExortOrder }