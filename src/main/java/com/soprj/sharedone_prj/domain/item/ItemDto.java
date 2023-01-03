package com.soprj.sharedone_prj.domain.item;

import lombok.Data;

@Data
public class ItemDto {
    private int m_item_id;
    private String m_item_name;
    private String m_item_unit;
    private String m_item_group;
    private String m_item_manufacturer;
}
