package com.app.haetssal_jangteo.dto;

import com.app.haetssal_jangteo.domain.ReportMarketVO;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportMarketDTO {
    private Long reportId;
    private Long marketId;
    private String reportState;


    private String marketName;
    private String marketRegion;

    public ReportMarketVO toVO() {
        return ReportMarketVO.builder()
                .reportId(reportId)
                .marketId(marketId)
                .reportState(reportState)
                .build();
    }
}
