package com.app.haetssal_jangteo.domain;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class ReportItemVO {
    private Long reportId;
    private Long itemId;
    private String reportReason;
    private String reportContent;
}
