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
        System.out.println("service: " + itemDto);

        int m_item_id = itemDto.getM_item_id();

        if (m_item_id == 0) {
        int cnt = itemMapper.register(itemDto);
        System.out.println("mapper: " + cnt);

        return cnt;
        }
        else {
//            int cnt = itemMapper.update()
            return itemMapper.update(itemDto);
        }
    }

    public List<ItemDto> itemList() {

        return itemMapper.selectItemList();
    }

    public ItemDto get(int m_item_id) {
        System.out.println("id: " + m_item_id);
        return itemMapper.select(m_item_id);
    }

    public int remove(int m_item_id) {
        System.out.println("service remove 진행");
        ItemDto itemDto = itemMapper.select(m_item_id);
        return itemMapper.remove(m_item_id);
    }
}
