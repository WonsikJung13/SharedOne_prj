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
            return itemMapper.register(itemDto);
        }
        else {
            return itemMapper.update(itemDto);
        }
    }

    public List<ItemDto> itemList(int page, String type, String keyword, ItemDto itemDto) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = itemMapper.countAll(type, "%"+keyword+"%");
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

        return itemMapper.selectItemList(offset, records, type, "%"+keyword+"%");
    }

    public ItemDto get(String m_item_id) {
        return itemMapper.select(m_item_id);
    }

    public int remove(String removeList) {
        return itemMapper.remove(removeList);
    }

    public List<String> selectGroup() {

        return itemMapper.selectGroup();
    }

    public List<String> selectManufacturer(String m_item_group) {

        return itemMapper.selectManufacturer(m_item_group);
    }

    public int itemCompare(ItemDto itemCompareList) {
        System.out.println("service: " + itemCompareList);
        return itemMapper.itemCompare(itemCompareList);
    }
}