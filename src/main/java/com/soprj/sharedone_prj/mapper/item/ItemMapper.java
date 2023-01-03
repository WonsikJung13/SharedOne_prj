package com.soprj.sharedone_prj.mapper.item;

import com.soprj.sharedone_prj.domain.item.ItemDto;

import java.util.List;

public interface ItemMapper {

    int register(ItemDto itemDto);

    List<ItemDto> selectItemList();

    ItemDto select(int m_item_id);

    int update(ItemDto itemDto);

    int remove(int m_item_id);
}
