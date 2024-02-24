package com.nicsi.ceda.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nicsi.ceda.model.ListOfSchemeForReport;

public interface ListOfSchemeForReportRepo extends JpaRepository<ListOfSchemeForReport, Integer>
{
	List<ListOfSchemeForReport> findByStatus(int status);

	ListOfSchemeForReport findBySchemeCode(int schemeCode);
}
