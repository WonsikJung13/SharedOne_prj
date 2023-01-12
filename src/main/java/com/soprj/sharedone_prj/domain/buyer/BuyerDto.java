package com.soprj.sharedone_prj.domain.buyer;

import lombok.Data;

@Data
public class BuyerDto {

    private String m_buyer_id;

    private String m_buyer_name;

    private String m_buyer_region;

    private String m_buyer_address;

    private String m_buyer_number;

    private String m_buyer_currency;

    public int lastPageNumber;
    public int leftPageNumber;
    public int rightPageNumber;
    public int currentPageNumber;
    private boolean hasPrevButton;
    private boolean hasNextButton;
    private int jumpPrevPageNumber;
    private int jumpNextPageNumber;

    private String searchNum;
    private String searchText;
}
