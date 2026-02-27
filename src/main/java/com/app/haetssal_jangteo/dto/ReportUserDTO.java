package com.app.haetssal_jangteo.dto;

import com.app.haetssal_jangteo.domain.ReportUserVO;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportUserDTO {
    private Long reportId;
    private Long userId;
    private String reportReason;
    private String reportContent;


    private String userName;
    private String userEmail;

    public ReportUserVO toVO() {
        return ReportUserVO.builder()
                .reportId(reportId)
                .userId(userId)
                .reportReason(reportReason)
                .reportContent(reportContent)
                .build();
    }
}
