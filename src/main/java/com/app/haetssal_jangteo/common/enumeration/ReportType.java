package com.app.haetssal_jangteo.common.enumeration;

import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public enum ReportType {
    MARKET("market"), SELLER("seller"), REPORT("report");

    private String value;

    private static final Map<String, ReportType> REPORT_TYPE_MAP =
            Arrays.stream(ReportType.values()).collect(Collectors.toMap(ReportType::getValue, Function.identity()));

    ReportType(String value) {
        this.value = value;
    }

    public static ReportType getReportType(String value) {
        return REPORT_TYPE_MAP.get(value);
    }

    public String getValue() {
        return value;
    }
}
