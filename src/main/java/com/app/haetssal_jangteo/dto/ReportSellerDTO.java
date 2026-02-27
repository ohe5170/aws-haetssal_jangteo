package com.app.haetssal_jangteo.dto;

import com.app.haetssal_jangteo.domain.ReportSellerVO;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportSellerDTO {
    private Long reportId;
    private Long sellerId;
    private String reportState;


    private String sellerName;
    private String sellerEmail;

    public ReportSellerVO toVO() {
        return ReportSellerVO.builder()
                .reportId(reportId)
                .sellerId(sellerId)
                .reportState(reportState)
                .build();
    }
}
