package com.app.haetssal_jangteo.dto;

import com.app.haetssal_jangteo.domain.ReportItemVO;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportItemDTO {
    private Long reportId;
    private Long itemId;
    private String reportReason;
    private String reportContent;


    private String itemName;
    private String storeName;

    public ReportItemVO toVO() {
        return ReportItemVO.builder()
                .reportId(reportId)
                .itemId(itemId)
                .reportReason(reportReason)
                .reportContent(reportContent)
                .build();
    }
}
