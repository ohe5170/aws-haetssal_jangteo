package com.app.haetssal_jangteo.domain;

import com.app.haetssal_jangteo.common.enumeration.ReportType;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode(of = "id")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class ReportVO {
    private Long id;
    private ReportType reportType;
    private Long reportReporterId;
    private String createdDatetime;
}
