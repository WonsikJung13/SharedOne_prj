package com.soprj.sharadeone_prj.service;

import com.soprj.sharadeone_prj.domain.SampleDTO;
import com.soprj.sharadeone_prj.mapper.SampleMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SampleService {

    @Autowired
    private SampleMapper sampleMapper;

    public int register(SampleDTO sampleDTO) {
        return sampleMapper.register(sampleDTO);
    }
}
