<%-- 
    Document   : my-posted-errands
    Created on : Apr 1, 2020, 7:43:51 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="errands-main errands-list">
    <div class="sidebar">
        <div class="side-box ongoing-errands p-3 position-relative">
            <h6 class="font-weight-bold "> Ongoing Errands</h6>
            <div class="scrollbox dragscroll">
                <p class="no-activity ">You currently have no activity running.</p>
                <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Veiw-Errand" class="view-errand-main">
                    <div class="user-card">
                        <div class="divide split">
                            <p class="posted">You posted</p>
                            <p class="time">2 Hours ago</p>
                        </div>
                        <div class="main-card divide">
                            <img class="profile-picture-inner mr-3" src="./img/idris.jpg"
                                 alt="profile-picture">
                            <div class="details divide down">
                                <p class="user-name">
                                    Jumoke Adeleke
                                </p>
                                <p class="errand-details">My dog needs a bath, I haven't washed her in
                                    months,
                                    she's
                                    super...</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Veiw-Errand" class="view-errand-main">
                    <div class="user-card">
                        <div class="divide split p-0">
                            <p class="you-accepted">You Accepted</p>
                            <p class="time">15 Minutes ago</p>
                        </div>
                        <div class="main-card divide">
                            <img class="profile-picture-inner mr-3" src="./img/idris.jpg"
                                 alt="profile-picture">
                            <div class="details divide down">
                                <p class="user-name">
                                    Nelson Igwilo
                                </p>
                                <p class="errand-details">My dog needs a bath, I haven't washed her in
                                    months,
                                    she's
                                    super...</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Veiw-Errand" class="view-errand-main">
                    <div class="user-card">
                        <div class="divide split p-0">
                            <p class="you-accepted">You Accepted</p>
                            <p class="time">15 Minutes ago</p>
                        </div>
                        <div class="main-card divide">
                            <img class="profile-picture-inner mr-3" src="./img/idris.jpg"
                                 alt="profile-picture">
                            <div class="details divide down">
                                <p class="user-name">
                                    Nelson Igwilo
                                </p>
                                <p class="errand-details">My dog needs a bath, I haven't washed her in
                                    months,
                                    she's
                                    super...</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Veiw-Errand" class="view-errand-main">
                    <div class="user-card">
                        <div class="divide split p-0">
                            <p class="you-accepted">You Accepted</p>
                            <p class="time">15 Minutes ago</p>
                        </div>
                        <div class="main-card divide">
                            <img class="profile-picture-inner mr-3" src="./img/idris.jpg"
                                 alt="profile-picture">
                            <div class="details divide down">
                                <p class="user-name">
                                    Nelson Igwilo
                                </p>
                                <p class="errand-details">My dog needs a bath, I haven't washed her in
                                    months,
                                    she's
                                    super...</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="side-box ongoing-bids p-3">
            <h6 class="font-weight-bold">Ongoing Bids</h6>
            <div class="scrollbox dragscroll">
                <p class="no-activity">You currently have no ongoing bids running.</p>
                <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Veiw-Errand" class="view-errand-main">
                    <div class="user-card">
                        <div class="divide split">
                            <p class="pending">Pending</p>
                        </div>
                        <div class="main-card divide">
                            <img class="profile-picture mr-3" src="./img/dope.jpg" alt="profile-picture">
                            <div class="details divide down">
                                <p class="user-name">
                                    Daniel Waters
                                </p>
                                <p class="errand-details">My dog needs a bath, I haven't washed her in
                                    months,
                                    she's
                                    super friendly...</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Veiw-Errand" class="view-errand-main">
                    <div class="user-card">
                        <div class="divide split">
                            <p class="accepted">Accepted</p>
                        </div>
                        <div class="main-card divide">
                            <img class="profile-picture mr-3" src="./img/dope.jpg" alt="profile-picture">
                            <div class="details divide down">
                                <p class="user-name">
                                    Daniel Waters
                                </p>
                                <p class="errand-details">My dog needs a bath, I haven't washed her in
                                    months,
                                    she's
                                    super friendly...</p>
                            </div>
                        </div>
                    </div>
                </a>
                <div class="user-card">
                    <div class="divide split">
                        <p class="rejected">Rejected</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture mr-3" src="./img/dope.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Daniel Waters
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super friendly...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-body errand">
        <div class="profile-page">

            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="errand-card">
                                <h5 class="task-title">Shopping</h5>
                                <p class="full-details">I am in Ajah, I need someone to help me pick up my
                                    clothes from my friend in Ikeja Along before 6:00pm today.
                                </p>
                                <div class="bottom-errands">
                                    <div class="errand-location summary">
                                        <h6>Mende, Maryland, Lagos</h6>
                                        <p><i class="material-icons text-danger">
                                                location_on
                                            </i> Location</p>
                                    </div>
                                    <div class="summary">
                                        <h6 class="green-cash">$ 2,000</h6>
                                        <p class="grey-text">Reward</p>
                                    </div>
                                    <div class="summary">
                                        <h6 class="green-cash">$ 21,000</h6>
                                        <p class="grey-text">Insurance</p>
                                    </div>
                                    <div class="summary">
                                        <h6 class="date">01:04pm, 14th, Feb. 2020</h6>
                                        <p class="grey-text">Insurance</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="user-profile-card">
                                <h5 class="dash-titles bluetext font-weight-bold mb-n2">Bids</h5>
                                <div class="no-bids">No Bids Yet</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="user-review">
                                <h5 class="dash-titles bluetext">Bids</h5>
                                <ul class="m-0 p-0">
                                    <li class="review-list">
                                        <img class="reviewers-pix" src="./img/lib.jpg" alt="">
                                        <div>
                                            <h6 class="bidder-name">Ayodeji Adebami</h6>
                                            <div class="dash-stars bids">
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star_half</i>
                                                <i class="material-icons">star_border</i>
                                            </div>
                                            <h6 class="errand-num">2 Completed Errands</h6>
                                            <p class="review-comment">Lorem ipsum dolor sit amet consectetur
                                                adipisicing elit. Suscipit
                                                libero molestiae aliquam eveniet amet placeat velit
                                                molestias
                                                perspiciatis itaque</p>
                                            <div class="bid-bottom">
                                                <div>
                                                    <span class="bid">N 1,500</span> <a href="#"
                                                                                        id="negotiate-btn"
                                                                                        class="negotiate-btn">Negotiate</a>
                                                </div>
                                                <div>
                                                    <a href="/feed-activity1.html" class="accept-bid">Accept Bid</a>
                                                    <a href="#" class="reject-bid">Reject Bid</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="review-list negotiated">
                                        <img class="reviewers-pix" src="./img/waed.jpg" alt="">
                                        <div>
                                            <h6 class="bidder-name">Noah Persley</h6>
                                            <div class="dash-stars bids">
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star_half</i>
                                                <i class="material-icons">star_border</i>
                                            </div>
                                            <h6 class="errand-num">12 Completed Errands</h6>
                                            <p class="review-comment">Lorem ipsum dolor sit amet consectetur
                                                adipisicing elit. Suscipit
                                                libero molestiae aliquam eveniet amet placeat velit
                                                molestias
                                                perspiciatis itaque</p>
                                            <h6 class="errand-num">Bid: <span
                                                    class="text-dark font-weight-bold">N
                                                    2,000</span></h6>
                                            <div class="bid-bottom">
                                                <div>
                                                    <span class="errand-num">New Offer: </span> <span
                                                        class="bid">N
                                                        1,500</span> <a href="#" id="negotiate-btn2"
                                                                    class="negotiate-btn">Negotiate</a>
                                                </div>
                                                <div>
                                                    <a href="#" class="accept-bid">Accept Bid</a>
                                                    <a href="#" class="reject-bid">Reject Bid</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="review-list">
                                        <img class="reviewers-pix" src="./img/user-avatar-placeholder.png"
                                             alt="">
                                        <div>
                                            <h6 class="bidder-name">Rowland Pasuma</h6>
                                            <div class="dash-stars bids">
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star</i>
                                                <i class="material-icons">star_half</i>
                                                <i class="material-icons">star_border</i>
                                            </div>
                                            <h6 class="errand-num">0 Completed Errands</h6>
                                            <p class="review-comment">Lorem ipsum dolor sit amet consectetur
                                                adipisicing elit. Suscipit
                                                libero molestiae aliquam eveniet amet placeat velit
                                                molestias
                                                perspiciatis itaque</p>
                                            <div class="bid-bottom">
                                                <div>
                                                    <span class="bid">N 1,500</span> <a href="#"
                                                                                        id="negotiate-btn3"
                                                                                        class="negotiate-btn">Negotiate</a>
                                                </div>
                                                <div>
                                                    <a href="#" class="accept-bid">Accept Bid</a>
                                                    <a href="#" class="reject-bid">Reject Bid</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 position-relative">
                    <div class="activity-feed">
                        <h5 class="dash-titles">Activity Feed</h5>
                        <p class="no-activity">You currently have no activity running.</p>
                        <div class="activity-timeline">
                            <div class="circle-filled-w"></div>
                            <div class="activity-line"></div>
                            <br>
                            <br>
                            <div class="circle-filled-w-empty"></div>
                            <div class="activity-line"></div>
                            <br>
                            <br>
                            <div class="circle-filled-w-empty"></div>
                            <div class="activity-line"></div>
                            <br>
                            <br>
                            <div class="circle-filled-w-empty"></div>
                        </div>
                        <p class="activity-content-1">Waiting for bids</p>
                        <p class="activity-content-2">Accept Bidder</p>
                        <p class="activity-content-2">Errand Started</p>
                        <p class="activity-content-2">Errand Over</p>
                        <div class="text-center pt-5">
                            <a class="btn btn-lg btn-outline-danger abort-errand" id="abort" href="#">
                                Abort Errand
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog bid-request">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header border-0 bid-request">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <li class="negotiate-pop border-0 mx-3">
                <img class="reviewers-pix" src="./img/lib.jpg" alt="">
                <div>
                    <h6 class="bidder-name">Ayodeji Adebami</h6>
                    <div class="dash-stars bids">
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star_half</i>
                        <i class="material-icons">star_border</i>
                    </div>
                    <h6 class="errand-num">2 Completed Errands</h6>
                    <p class="review-comment">Lorem ipsum dolor sit amet consectetur
                        adipisicing elit. Suscipit
                        libero molestiae aliquam eveniet amet placeat velit
                        molestias
                        perspiciatis itaque</p>
                </div>
            </li>
            <div class="text-center mx-4">
                <input type="range" class="istyle" />
            </div>
            <div class="bottom-pop mx-4">
                <div class="side-a">
                    <p class="negotiate-price">N 1,500</p>
                    <p>Your Offer</p>
                </div>
                <div class="side-b">
                    <p class="negotiate-price">N 2,000</p>
                    <p>Runners Bid</p>
                </div>
            </div>
            <div style="display: flex; justify-content: center;"><span class="ctrl">New Offer:</span>
                &nbsp;<input class="bid-input" width="5" value="1500" type="number">
            </div>
            <div class="text-center my-5">
                <button type="button" class="btn btn-lg btn-primary px-5"
                        data-dismiss="modal">Negotiate</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="cancel" role="dialog">
    <div class="modal-dialog bid-request">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header bid-request">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body text-center verify-msg">
                <i class="material-icons xl-txt text-danger mb-4">warning</i>
                <p>Aborting this errand attracts a penalty; <br>
                    Are you sure you want to Abort this errand?</p>
            </div>
            <div class=" mb-3">
                <button type="button" class="btn btn-lg btn-primary ml-5 float-left" data-dismiss="modal">Don't
                    Abort</button>
                <button type="button" class="btn btn-lg btn-outline-danger float-right mr-5"
                        data-dismiss="modal">Abort</button>
            </div>
        </div>
    </div>
</div>
