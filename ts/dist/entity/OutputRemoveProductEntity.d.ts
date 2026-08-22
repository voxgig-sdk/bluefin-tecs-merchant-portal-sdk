import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputRemoveProduct, OutputRemoveProductCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputRemoveProductEntity extends BluefinTecsMerchantPortalEntityBase<OutputRemoveProduct> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputRemoveProductEntity): OutputRemoveProductEntity;
    create(this: any, reqdata?: OutputRemoveProductCreateData, ctrl?: Control): Promise<OutputRemoveProductEntity>;
}
export { OutputRemoveProductEntity };
