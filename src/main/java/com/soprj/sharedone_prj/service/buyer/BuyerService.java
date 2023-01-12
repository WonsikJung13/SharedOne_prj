package com.soprj.sharedone_prj.service.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.mapper.buyer.BuyerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BuyerService {

    @Autowired
    private BuyerMapper buyerMapper;

    public List<BuyerDto> listBuyer() {
        return buyerMapper.list();
    }

    public BuyerDto getDuo(String m_buyer_name, String m_buyer_id) {
        return buyerMapper.selectDuo(m_buyer_name, m_buyer_id);
    }


    public int addBuyer(BuyerDto buyer) {
        return buyerMapper.addBuyer(buyer);
    }


    public int update(BuyerDto buyer) {
        return buyerMapper.updateBuyer(buyer);
    }

    public int register(Map<String, Object> buyer) {
        int cnt = buyerMapper.insert(buyer);
        return cnt;
    }

    public int remove(String m_buyer_id) {
        return buyerMapper.removeById(m_buyer_id);
    }

    public BuyerDto get(String m_buyer_id) {
        return buyerMapper.select(m_buyer_id);
    }

    public BuyerDto getBuyerNum(String m_buyer_number) {
        return buyerMapper.getBuyerNum(m_buyer_number);
    }

    public List<BuyerDto> getBuyerList(int page, BuyerDto buyerDto, String searchNum, String searchText) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = buyerMapper.countAll(searchNum, "%" + searchText + "%");
        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page -1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        rightPageNumber = Math.min(rightPageNumber, lastPage);

        // 이전버튼 유무
        boolean hasPrevButton = page > 10;
        // 다음버튼 유무
        boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);

        // 이전버튼 눌렀을 때 가는 페이지 번호
        int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
        int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;

        buyerDto.setHasPrevButton(hasPrevButton);
        buyerDto.setHasNextButton(hasNextButton);
        buyerDto.setJumpPrevPageNumber(jumpPrevPageNumber);
        buyerDto.setJumpNextPageNumber(jumpNextPageNumber);
        buyerDto.setCurrentPageNumber(page);
        buyerDto.setLeftPageNumber(leftPageNumber);
        buyerDto.setRightPageNumber(rightPageNumber);
        buyerDto.setLastPageNumber(lastPage);

        return buyerMapper.getBuyerList(offset, records, searchNum, "%" + searchText + "%");
    }
}


