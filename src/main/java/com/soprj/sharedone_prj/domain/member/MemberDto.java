package com.soprj.sharedone_prj.domain.member;

import lombok.Data;

import java.util.List;

@Data
public class MemberDto {

    private String m_member_id;

    private String m_member_password;

    private int m_authority_id;

    private String m_member_email;

    private String m_authority_grade;

    public int lastPageNumber;
    public int leftPageNumber;
    public int rightPageNumber;
    public int currentPageNumber;
    private boolean hasPrevButton;
    private boolean hasNextButton;
    private int jumpPrevPageNumber;
    private int jumpNextPageNumber;

}
