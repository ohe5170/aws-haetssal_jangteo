package com.app.haetssal_jangteo.domain;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class ReportMarketVO {
    private Long reportId;
    private Long marketId;
    private String reportState;
}
