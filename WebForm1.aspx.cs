using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlickrNet; 

namespace ContribeSpaFlickr
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        // Use Your developer key and shared secret below

        string flickrKey = "3ebb619beff2184ef14009b703d563d5";
        string sharedSecret = "cdcfda9116131908";



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string defaultKeyword = "Kaes";
                SearchTextBox.Text = defaultKeyword;
                GetPictures(defaultKeyword);

                Literal HiddenPhotoId = ThumbnailsList.Items[0].FindControl("HiddenPhotoId") as Literal;
                Literal HiddenPhotoUrl = ThumbnailsList.Items[0].FindControl("HiddenPhotoUrl") as Literal;

                string photoId = HiddenPhotoId.Text;
                string photoUrl = HiddenPhotoUrl.Text;

                PreviewImage.ImageUrl = photoUrl;
                GetDescription(photoId);
            }
        }


        protected void HITButton_Click(object sender, EventArgs e)
        {
            string keyword = SearchTextBox.Text.Trim();
            GetPictures(keyword);
        }

        private void GetPictures(string tag)
        {
            PhotoSearchOptions options = new PhotoSearchOptions();
            options.PerPage = 18;
            options.Page = 1;
            options.SortOrder = PhotoSearchSortOrder.DatePostedDescending;
            options.MediaType = MediaType.Photos;
            options.Extras = PhotoSearchExtras.All;
            options.Tags = tag;

            Flickr flickr = new Flickr(flickrKey, sharedSecret);
            PhotoCollection photos = flickr.PhotosSearch(options);

            ThumbnailsList.DataSource = photos;
            ThumbnailsList.DataBind();
        }


        private void GetDescription(string photoId)
        {
            Flickr flickr = new Flickr(flickrKey, sharedSecret);
            PhotoInfo info = flickr.PhotosGetInfo(photoId);

            PhotoDescription.Text = info.Description;
            PhotoDateTaken.Text = info.DateTaken.ToString("MMMM dd,  yyyy");
        }


        protected void ThumbnailsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Literal HiddenPhotoId = ThumbnailsList.SelectedItem.FindControl("HiddenPhotoId") as Literal;
            Literal HiddenPhotoUrl = ThumbnailsList.SelectedItem.FindControl("HiddenPhotoUrl") as Literal;

            string photoId = HiddenPhotoId.Text;
            string photoUrl = HiddenPhotoUrl.Text;

            PreviewImage.ImageUrl = photoUrl;
            GetDescription(photoId);
        } 
    }
}