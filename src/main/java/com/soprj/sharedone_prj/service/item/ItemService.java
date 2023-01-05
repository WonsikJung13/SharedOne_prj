package com.soprj.sharedone_prj.service.item;

import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.mapper.item.ItemMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ItemService {

    @Setter(onMethod_ = @Autowired)
    private ItemMapper itemMapper;

    public int register(ItemDto itemDto) {

        String m_item_id = itemDto.getM_item_id();

        if (m_item_id == null) {
            System.out.println("등록 진행!");
//            String itemId = itemDto.getM_item_group() + itemDto.getM_item_manufacturer() + itemDto.getM_item_name();
//            System.out.println(itemId);
//            itemDto.setM_item_id(itemId);
            int cnt = itemMapper.register(itemDto);

            return cnt;
        }
        else {
            System.out.println("수정 진행!");
            return itemMapper.update(itemDto);
        }
    }

    public List<ItemDto> itemList(String itemIdParam, int page, ItemDto itemDto) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = itemMapper.countAll();
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

        itemDto.setHasPrevButton(hasPrevButton);
        itemDto.setHasNextButton(hasNextButton);
        itemDto.setJumpPrevPageNumber(jumpPrevPageNumber);
        itemDto.setJumpNextPageNumber(jumpNextPageNumber);
        itemDto.setCurrentPageNumber(page);
        itemDto.setLeftPageNumber(leftPageNumber);
        itemDto.setRightPageNumber(rightPageNumber);
        itemDto.setLastPageNumber(lastPage);

        return itemMapper.selectItemList(itemIdParam, offset, records);
    }

    public ItemDto get(String m_item_id) {
        return itemMapper.select(m_item_id);
    }

    public int remove(String m_item_id) {
        ItemDto itemDto = itemMapper.select(m_item_id);
        return itemMapper.remove(m_item_id);
    }

    public List<String> selectGroup() {

        return itemMapper.selectGroup();
    }

    public List<String> selectManufacturer() {

        return itemMapper.selectManufacturer();
    }
}
