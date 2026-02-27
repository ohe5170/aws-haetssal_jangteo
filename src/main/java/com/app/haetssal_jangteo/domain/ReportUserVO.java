package com.app.haetssal_jangteo.domain;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode(of = "reportId")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class ReportUserVO {
    private Long reportId;
    private Long userId;
    private String reportReason;
    private String reportContent;
}
