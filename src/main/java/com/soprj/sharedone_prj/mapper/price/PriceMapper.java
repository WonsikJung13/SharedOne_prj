package com.soprj.sharedone_prj.mapper.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;

import java.util.List;

public interface PriceMapper {
    List<PriceDto> getPriceList();

    int insertRegister(PriceDto price);
}
