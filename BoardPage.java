package model1.board;

public class BoardPage {
    public static String paging(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
        String pagingStr = "";

        // 3. 전체 페이지 수 계산
        int totalPages = (int)Math.ceil((double)totalCount/ pageSize);

        // 4. 이전 페이지 블록 바로가기 출력
        int pageTmp = ((pageNum-1) / blockPage) * blockPage + 1;
        if(pageTmp != 1) {
            pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
            pagingStr += "&nbsp;";
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTmp-1)+ "'>[이전 블록]</a>";
        }

        // 5. 각 페이지 번호를 출력
        int blockCount = 1;
        while(blockCount <= blockPage && pageTmp <= totalPages) {
            // 현재 페이지는 링크 없이 그냥 글자
            if(pageTmp == pageNum) {
                pagingStr += "&nbsp;" + pageTmp + "&nbsp;";
            } else {
                pagingStr += "&nbsp;<a href='"+ reqUrl + "?pageNum=" + pageTmp + "'>" + pageTmp + "</a>&nbsp;";
            }

            pageTmp++;
            blockCount++;

        }

        // 6. 다음 페이지 블록 바로가기 출력
        if (pageTmp <= totalPages) {
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTmp + "'>[다음 블록]</a>";
            pagingStr += "&nbsp;";
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
        }

        return pagingStr;
    }
}
