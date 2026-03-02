package com.app.haetssal_jangteo.mybatis.handler;

import com.app.haetssal_jangteo.common.enumeration.ReportType;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportTypeHandler implements TypeHandler<ReportType> {
    @Override
    public void setParameter(PreparedStatement ps, int i, ReportType parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.getValue());
    }

    @Override
    public ReportType getResult(ResultSet rs, String columnName) throws SQLException {
        String value = rs.getString(columnName);
        return value == null ? null : ReportType.getReportType(value);
    }

    @Override
    public ReportType getResult(ResultSet rs, int columnIndex) throws SQLException {
        String value = rs.getString(columnIndex);
        return value == null ? null : ReportType.getReportType(value);
    }

    @Override
    public ReportType getResult(CallableStatement cs, int columnIndex) throws SQLException {
        String value = cs.getString(columnIndex);
        return value == null ? null : ReportType.getReportType(value);
    }
}
