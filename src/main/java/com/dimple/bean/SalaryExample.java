package com.dimple.bean;

import java.util.ArrayList;
import java.util.List;

public class SalaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SalaryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSalaIdIsNull() {
            addCriterion("sala_id is null");
            return (Criteria) this;
        }

        public Criteria andSalaIdIsNotNull() {
            addCriterion("sala_id is not null");
            return (Criteria) this;
        }

        public Criteria andSalaIdEqualTo(Integer value) {
            addCriterion("sala_id =", value, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdNotEqualTo(Integer value) {
            addCriterion("sala_id <>", value, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdGreaterThan(Integer value) {
            addCriterion("sala_id >", value, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("sala_id >=", value, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdLessThan(Integer value) {
            addCriterion("sala_id <", value, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdLessThanOrEqualTo(Integer value) {
            addCriterion("sala_id <=", value, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdIn(List<Integer> values) {
            addCriterion("sala_id in", values, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdNotIn(List<Integer> values) {
            addCriterion("sala_id not in", values, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdBetween(Integer value1, Integer value2) {
            addCriterion("sala_id between", value1, value2, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaIdNotBetween(Integer value1, Integer value2) {
            addCriterion("sala_id not between", value1, value2, "salaId");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidIsNull() {
            addCriterion("sala_empId is null");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidIsNotNull() {
            addCriterion("sala_empId is not null");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidEqualTo(Integer value) {
            addCriterion("sala_empId =", value, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidNotEqualTo(Integer value) {
            addCriterion("sala_empId <>", value, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidGreaterThan(Integer value) {
            addCriterion("sala_empId >", value, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidGreaterThanOrEqualTo(Integer value) {
            addCriterion("sala_empId >=", value, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidLessThan(Integer value) {
            addCriterion("sala_empId <", value, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidLessThanOrEqualTo(Integer value) {
            addCriterion("sala_empId <=", value, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidIn(List<Integer> values) {
            addCriterion("sala_empId in", values, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidNotIn(List<Integer> values) {
            addCriterion("sala_empId not in", values, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidBetween(Integer value1, Integer value2) {
            addCriterion("sala_empId between", value1, value2, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaEmpidNotBetween(Integer value1, Integer value2) {
            addCriterion("sala_empId not between", value1, value2, "salaEmpid");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryIsNull() {
            addCriterion("sala_baseSalary is null");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryIsNotNull() {
            addCriterion("sala_baseSalary is not null");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryEqualTo(Double value) {
            addCriterion("sala_baseSalary =", value, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryNotEqualTo(Double value) {
            addCriterion("sala_baseSalary <>", value, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryGreaterThan(Double value) {
            addCriterion("sala_baseSalary >", value, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryGreaterThanOrEqualTo(Double value) {
            addCriterion("sala_baseSalary >=", value, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryLessThan(Double value) {
            addCriterion("sala_baseSalary <", value, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryLessThanOrEqualTo(Double value) {
            addCriterion("sala_baseSalary <=", value, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryIn(List<Double> values) {
            addCriterion("sala_baseSalary in", values, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryNotIn(List<Double> values) {
            addCriterion("sala_baseSalary not in", values, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryBetween(Double value1, Double value2) {
            addCriterion("sala_baseSalary between", value1, value2, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaBasesalaryNotBetween(Double value1, Double value2) {
            addCriterion("sala_baseSalary not between", value1, value2, "salaBasesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryIsNull() {
            addCriterion("sala_performanceSalary is null");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryIsNotNull() {
            addCriterion("sala_performanceSalary is not null");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryEqualTo(Double value) {
            addCriterion("sala_performanceSalary =", value, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryNotEqualTo(Double value) {
            addCriterion("sala_performanceSalary <>", value, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryGreaterThan(Double value) {
            addCriterion("sala_performanceSalary >", value, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryGreaterThanOrEqualTo(Double value) {
            addCriterion("sala_performanceSalary >=", value, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryLessThan(Double value) {
            addCriterion("sala_performanceSalary <", value, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryLessThanOrEqualTo(Double value) {
            addCriterion("sala_performanceSalary <=", value, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryIn(List<Double> values) {
            addCriterion("sala_performanceSalary in", values, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryNotIn(List<Double> values) {
            addCriterion("sala_performanceSalary not in", values, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryBetween(Double value1, Double value2) {
            addCriterion("sala_performanceSalary between", value1, value2, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaPerformancesalaryNotBetween(Double value1, Double value2) {
            addCriterion("sala_performanceSalary not between", value1, value2, "salaPerformancesalary");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceIsNull() {
            addCriterion("sala_attendance is null");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceIsNotNull() {
            addCriterion("sala_attendance is not null");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceEqualTo(Double value) {
            addCriterion("sala_attendance =", value, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceNotEqualTo(Double value) {
            addCriterion("sala_attendance <>", value, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceGreaterThan(Double value) {
            addCriterion("sala_attendance >", value, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceGreaterThanOrEqualTo(Double value) {
            addCriterion("sala_attendance >=", value, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceLessThan(Double value) {
            addCriterion("sala_attendance <", value, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceLessThanOrEqualTo(Double value) {
            addCriterion("sala_attendance <=", value, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceIn(List<Double> values) {
            addCriterion("sala_attendance in", values, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceNotIn(List<Double> values) {
            addCriterion("sala_attendance not in", values, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceBetween(Double value1, Double value2) {
            addCriterion("sala_attendance between", value1, value2, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaAttendanceNotBetween(Double value1, Double value2) {
            addCriterion("sala_attendance not between", value1, value2, "salaAttendance");
            return (Criteria) this;
        }

        public Criteria andSalaStationIsNull() {
            addCriterion("sala_station is null");
            return (Criteria) this;
        }

        public Criteria andSalaStationIsNotNull() {
            addCriterion("sala_station is not null");
            return (Criteria) this;
        }

        public Criteria andSalaStationEqualTo(Double value) {
            addCriterion("sala_station =", value, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationNotEqualTo(Double value) {
            addCriterion("sala_station <>", value, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationGreaterThan(Double value) {
            addCriterion("sala_station >", value, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationGreaterThanOrEqualTo(Double value) {
            addCriterion("sala_station >=", value, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationLessThan(Double value) {
            addCriterion("sala_station <", value, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationLessThanOrEqualTo(Double value) {
            addCriterion("sala_station <=", value, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationIn(List<Double> values) {
            addCriterion("sala_station in", values, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationNotIn(List<Double> values) {
            addCriterion("sala_station not in", values, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationBetween(Double value1, Double value2) {
            addCriterion("sala_station between", value1, value2, "salaStation");
            return (Criteria) this;
        }

        public Criteria andSalaStationNotBetween(Double value1, Double value2) {
            addCriterion("sala_station not between", value1, value2, "salaStation");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}