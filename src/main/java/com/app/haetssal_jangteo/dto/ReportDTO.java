package com.app.haetssal_jangteo.dto;

import com.app.haetssal_jangteo.common.enumeration.ReportType;
import com.app.haetssal_jangteo.domain.ReportVO;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportDTO {
    private Long id;
    private ReportType reportType;
    private Long reportReporterId;
    private String createdDatetime;


    private String reporterName;
    private String reporterEmail;

    public ReportVO toVO() {
        return ReportVO.builder()
                .id(id)
                .reportType(reportType)
                .reportReporterId(reportReporterId)
                .createdDatetime(createdDatetime)
                .build();
    }
}
