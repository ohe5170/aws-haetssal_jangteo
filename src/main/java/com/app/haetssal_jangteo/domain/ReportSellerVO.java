package com.app.haetssal_jangteo.domain;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class ReportSellerVO {
    private Long reportId;
    private Long sellerId;
    private String reportState;
}
