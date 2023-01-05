package com.soprj.sharedone_prj.domain.item;

import lombok.Data;

import java.util.List;

@Data
public class ItemDto {
    private String m_item_id;
    private String m_item_name;
    private String m_item_unit;
    private String m_item_group;
    private String m_item_manufacturer;
    private int m_item_number;

    public int lastPageNumber;
    public int leftPageNumber;
    public int rightPageNumber;
    public int currentPageNumber;
    private boolean hasPrevButton;
    private boolean hasNextButton;
    private int jumpPrevPageNumber;
    private int jumpNextPageNumber;
}
