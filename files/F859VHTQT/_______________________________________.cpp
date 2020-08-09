class FontCache {
private:
    struct Item {
	HFONT hFont;
	IDWriteTextFormat* pTextFormat;
    };

    int mSize;
    Item *mItems;

public:
    FontCache(int size = 2) :
	mSize(size),
	mItems(new Item[size])
    {
    }

    ~FontCache(void)
    {
	for (int i = 0; i < mSize; ++i)
	    SafeRelease(&mItems[i].pTextFormat);
	delete[] mItems;
    }

    bool get(HFONT hFont, IDWriteTextFormat** ppTextFormat)
    {
	int n = find(hFont);
	if (n < 0)
	    return false;
	*ppTextFormat = mItems[n].pTextFormat;
	slide(n);
	return true;
    }

    void put(HFONT hFont, IDWriteTextFormat* pTextFormat)
    {
	int n = find(hFont);
	if (n < 0)
	    n = mSize - 1;
	if (mItems[n].pTextFormat != pTextFormat)
	{
	    SafeRelease(&mItems[n].pTextFormat);
	    mItems[n].pTextFormat = pTextFormat;
	}
	slide(n);
    }

private:
    int find(HFONT hFont)
    {
	for (int i = 0; i < mSize; ++i)
	{
	    if (mItems[i].hFont == hFont)
		return i;
	}
	return -1;
    }

    void slide(int nextTop)
    {
	if (nextTop == 0)
	    return;
	Item tmp = mItems[nextTop];
	for (int i = nextTop - 1; i >= 0; --i)
	    mItems[i + 1] = mItems[i];
	mItems[0] = tmp;
    }
};
