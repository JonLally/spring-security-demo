package com.jonlally.spring.security.repository;

import com.jonlally.spring.security.entity.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface JobRepository extends JpaRepository<Job, Integer> {
}
